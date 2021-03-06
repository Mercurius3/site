class McsubscribeController < ApplicationController
 
  def index
  end
 
  def subscribe  
    email = params[:email][:address]    
    if !email.blank?  
      begin
        @mc.lists.subscribe(@list_id, {'email' => email})
        respond_to do |format|  
          format.json{render :json => {:message => "Succes! U krijgt binnen enkele minuten een mailbericht van noreply@lassche-lassche.nl.\nKlik s.v.p. op de link in dat bericht.\nGeen mail ontvangen? Controleer dan s.v.p. uw spamfilter."}}
        end
       
      rescue Mailchimp::ListAlreadySubscribedError 
        respond_to do |format| 
          format.json{render :json => {:message => "#{email} u bent al aangemeld."}}
        end
       
      rescue Mailchimp::ListDoesNotExistError
        respond_to do |format|  
          format.json{render :json => {:message => "The list could not be found."}}
        end
       
      rescue Mailchimp::Error => ex 
        if ex.message
          respond_to do |format|        
            format.json{render :json => {:message => "There is an error. Please enter valid email id."}}
          end
        else
          respond_to do |format|        
            format.json{render :json => {:message => "An unknown error occurred."}}
          end              
        end 
      end
    else 
      respond_to do |format|        
        format.json{render :json => {:message => "Vul s.v.p. een geldig mailadres in."}}
      end
    end
  end
end