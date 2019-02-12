class SubscribersController < ApplicationController
  def index
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
#check if email exists in database
      if Subscriber.exists?(email: @subscriber.email)
        redirect_to root_path, alert:
        "Sorry, that email already exists!"
      elsif @subscriber.save
        redirect_to root_path, notice:
        "Thank you #{@subscriber.f_name}, for subscribing to my Newslatter!"
      else
        redirect_to root_path, alert:
        "Sorry, I failed to save your information. Please, try again!"
      end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
    end
end
