class SubsController < ApplicationController

  #model - all the logic on the table or records, database
  #constraints, associations

 
  # View - user sees and interacts with, front end, little logic

  #Controller /Routes = traffic director, 
  #controller should only be in charge of actions - aka what you can do on a webpage
    #create, update, etc. are actions
    #actions must return a response, a 'res'
      # HTML, XML, or JSON
      # if it doesn't return as a 'res' then redirect to another action that does

    #Callbacks - perform logic at certain actions
      # - before_action
      # - after_action
      # - skip_before_action 

      # before_action :method_to_call --> all of them
      # before_action :method_to_call, only: [:index, :show] --> only these actions
      # before_action :method_to_call, except: [:index, :show] --> only these actions
# READ = GET

  # index action - see all of the records of the table
  #   def index
  #     @model_names = Model_name.all
  #     #set into instance variable and grabs all the records
  #     #plural because it is showing all
  #   end

  #   show action - show a single record, id - id is which record you want to see
  #   def show
  #       @model_name = Model_name.find(params[:id])
  #       #singular because it's showing one
  #   end

  #   # new action - display the new record from - creates the record in memory (does not exist yet in db)
  #   def new
  #     @model_name = Model_name.new
  #   end

  #   # edit action - display to edit the record form - needs and ID - which record we need to update
  #   # ONLY SHOWS THE FORM ^^^^
  #   def edit 
  #     @model_name = Model_name.find(params[:id])
  #   end

  #   # create action / POST - creates record from new action into our db
  #   def create
  #     @model_name = Model_name.new(model_name_params)
  #     if @model_name.save
  #       do something or go somewhere
  #     else
  #       render :new
  #     end
  #   end

  #   # model_name_params --- add all the attributes to the params
  #     pass certain attr. 
  #       private
  #       def model_name_params
  #         params.require(:model_name).permit(:attr, :attr2, :everything the table has)
  #       end

  #   # update action / PUT or PATCH http request
  #         # - edits the record, from the edit form, need the ID to know which one to update

  #         def update 
  #           @model_name = Model_name.find(params[:id])
  #           if @model_name.update(model_name_params)
  #             do something
  #           else
  #             render :edit
  #           end
  #         end

  #     # destroy action / DELETE - deletes entire record, needs an ID so it knows which one to delete
  #     def destroy
  #       @model_name = Model_name.find(params[:id])
  #       @model_name.destroy

  #       or

  #       Model_name.find(params[:id]).destroy
  #     end


  #callback - make code more dry 

  before_action :set_sub, only: [:show, :update, :edit, :destroy]
  # before_action :set_sub, except: [:index, :new, :create]

  def index
    @subs = Sub.all
  end

  def show
    
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to @sub
    else
      render :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
    # or 

    # Sub.find(params[:id])
  end
  private
  def set_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:name)
  end
end



# def index
#   @subs = Sub.all
# end

# def show
#   @sub = Sub.find(params[:id])
# end

# def new
#   @sub = Sub.new
# end

# def create
#   @sub = Sub.new(sub_params)
#   if @sub.save
#     redirect_to @sub
#   else
#     render :new
#   end
# end

# def edit
#   @sub = Sub.find(params[:id])
# end

# def update
#   @sub = Sub.find(params[:id])
#   if @sub.update(sub_params)
#     redirect_to subs_path
#   else
#     render :edit
#   end
# end

# def destroy
#   @sub = Sub.find(params[:id])
#   @sub.destroy

#   # or 

#   # Sub.find(params[:id])
# end
# private
# def sub_params
#   params.require(:sub).permit(:name)
# end
# end