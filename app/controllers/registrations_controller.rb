class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  	super
    if @user.save
      account_sid = 'AC0d3d1f6e3eaefc38e91b56f8467d1c1d'
      auth_token = '2909e48a73fc9df231958b46b3ec0be8'
      client = Twilio::REST::Client.new account_sid, auth_token
      #client.account.messages.create(:from => '+1 731-602-5817',:to => '+91 94 07 138970'
      #,:body => 'Thanks for registration!') 
        client.account.messages.create(
          :from => '+1 731-602-5817',
          :to => '+91 94 07 138970',
          :body => 'Thanks for registration!'
        )
    else
      render :new
    end
  end

  def update
    super
  end

end 


