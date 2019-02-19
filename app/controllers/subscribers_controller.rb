class SubscribersController < ApplicationController
  #http_basic_authenticate_with name: "orko", password: "1234567",
  #except: [:create]

  before_action :admin_authorize, except: [:create]

  def index
    @subscribers = Subscriber.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
#check if email exists in database
      if Subscriber.exists?(email: @subscriber.email)
        redirect_to root_path, alert:
        "Sorry, that email already exists!"
      elsif @subscriber.save
        redirect_to root_path, notice:
        "Thank you #{@subscriber.f_name}, for subscribing to my Newsletter!"
      else
        redirect_to root_path, alert:
        "Sorry, I failed to save your information. Please, try again!"
      end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to subscribers_path
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
    end
end
