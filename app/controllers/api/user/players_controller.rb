class Api::User::PlayersController < Api::User::BaseController
  def dashboard
    players = Player.subscribers(current_api_user)
    
    @players_serializer = players.map { |i| PlayersSerializer.new(i, { current_user: current_api_user} ) }

    render json: { players: @players_serializer }, status: :ok
  end

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

  def subscribe
    player = Player.find(params[:player_id])
    @subscription = PlayerSubscription.new(player: player, user: current_api_user)
    
    if @subscription.save
      render status: :created
    else
      render json: { errors: @subscription.errors }, status: :unprocessable_entity
    end
  end


  def unsubscribe
    @subscription = PlayerSubscription.find_by(player: params[:player_id], user: current_api_user)
    
    if @subscription.present? && @subscription.destroy
      render status: :ok
    else
      render json: { errors: 'User not subscribed' }, status: :unprocessable_entity
    end
  end


  private

  def paginate_page
    params[:page] || 1
  end

  def order_players
    order_field = params[:order_field] || 'position'
    order_by = params[:order_by] || 'ASC'

    "#{order_field} #{order_by}"
  end
end
    