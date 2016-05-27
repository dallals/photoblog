class ContactsController < ApplicationController
  before_action :require_user

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to articles_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end