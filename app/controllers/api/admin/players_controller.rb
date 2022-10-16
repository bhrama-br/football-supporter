class Api::Admin::PlayersController < Api::Admin::BaseController
  def index
    players_count = Player.count
    players = Player.order(order_players).page(paginate_page)

    @players_serializer = players.map { |i| PlayersSerializer.new(i, { current_user: current_api_user} ) }

    render json: { players: @players_serializer, total_page: players.total_pages }, status: :ok
  end

  def show
    player = Player.find(params[:id])
    @player_serializer = PlayerSerializer.new(player, { current_user: current_api_user})

    render json: { player: @player_serializer }, status: :ok
  end

  def create_notification
    player = Player.find(params[:player_id])

    @notification = Notification.new(notifications_params)
    @notification.player_id = player.id
    if @notification.save
      SendNotificationJob.perform_later(@notification)
      render status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  def edit_notification
    @notification = Notification.find(params[:id])
    if @notification.update(notifications_params)
      render status: :ok
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  def destroy_notification
    @notification = Notification.find(params[:id])
    if @notification.destroy()
      render status: :ok
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
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

  def notifications_params
    params.permit(:message)
  end
end
    