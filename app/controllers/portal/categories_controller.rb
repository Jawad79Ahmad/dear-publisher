class Portal::CategoriesController < Portal::BaseController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to portal_category_path(rid: @category.rid), notice: 'Category created successfully.'
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @category.update(category_params)
      redirect_to request.referer, notice: 'Category updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @category.update(active: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by(rid: params[:rid])
      return redirect_to portal_categories_path, alert: 'Invalid request' unless @category.present?
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
