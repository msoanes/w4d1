require 'contacts_helper'

class ContactsController < ApplicationController
  include ContactsHelper

  def index
    @user = User.find(params[:user_id])
    @contacts = @user.all_contacts
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages,
             status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages,
             status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.delete
      render json: @contact
    else
      render json: @contact.errors.full_messages,
             status: :unprocessable_entity
    end
  end
end
