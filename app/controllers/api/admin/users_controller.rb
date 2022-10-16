class Api::Admin::UsersController < Api::Admin::BaseController
  def index
    users = User.order(order_players).page(paginate_page)
    @users_serializer = users.map { |i| UsersSerializer.new(i) }

    render json: { users: @users_serializer, total_page: users.total_pages }, status: :ok
  end

  def show
    user = User.find(params[:id])
    @user_serializer = UserSerializer.new(user)

    render json: { user: @user_serializer }, status: :ok
  end

  private

  def paginate_page
    params[:page] || 1
  end

  def order_players
    order_field = params[:order_field] || 'name'
    order_by = params[:order_by] || 'ASC'

    "#{order_field} #{order_by}"
  end
end
    