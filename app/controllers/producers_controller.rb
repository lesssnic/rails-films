class ProducersController < SecureController
  before_action :set_producer, only: %i[show update destroy]
  before_action :authorize_producer!
  after_action :verify_authorized
  skip_before_action :authenticate_user!, only: :index

  def index
    @producers = Producer.all
  end

  def create
    @producer = Producer.new(producer_params)
    render json: @producer.errors, status: :unprocessable_entity unless @producer.save
  end

  def update
    render json: @producer.errors, status: :unprocessable_entity unless @producer.update(producer_params)
  end

  def destroy
    @producer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_producer
    @producer = Producer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def producer_params
    params.fetch(:producer, {})
  end

  def authorize_producer!
    authorize(@producer || Producer)
  end
end
