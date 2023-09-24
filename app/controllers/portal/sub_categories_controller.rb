class Portal::SubCategoriesController < Portal::BaseController
  before_action :authenticate_user!
  before_action :set_sub_category, only: %i[show edit update destroy]

  def index
    @q = SubCategory.includes(:created_by).ransack(params[:q])
    @sub_categories = @q.result(distinct: true).order(:id).page(params[:page]).per(params[:limit] || 20)
    @sub_category_list = @sub_categories.as_json(include: [:created_by])
    @total_records = @q.result.count
  end

  def new
    @sub_category = SubCategory.new
    render turbo_stream: [
      turbo_stream.replace("show_default_modal", partial: "new", locals: { sub_category: @sub_category })
    ]
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to portal_sub_category_path(rid: @sub_category.rid), notice: 'Sub Category created successfully.'
    else
      render 'new'
    end
  end

  def edit; end

  def show
    render turbo_stream: [
      turbo_stream.replace("show_default_modal", partial: "show", locals: { sub_category: @sub_category })
    ]
  end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to request.referer, notice: 'Sub Category updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @sub_category.update(active: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find_by(rid: params[:rid])
      return redirect_to portal_sub_categories_path, alert: 'Invalid request' unless @sub_category.present?
    end

    def sub_category_params
      params.require(:sub_category).permit(:name, :category_id)
    end
end
