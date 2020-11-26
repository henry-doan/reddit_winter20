class SubsController < ApplicationController
  # Fat models and skinny controller 
  # Actions - things able to do inside of your app 
              #  HTTP Verbs
  # C reate  -> POST
  # R ead    -> GET
  # U pdate  -> PUT / PATCH
  # D estroy  -> DELETE

  # index action all of the records
    # GET READ
    # def index 
    #   @model_names = Model_name.all
    # end

  # show action display a record 
    # GET READ 
    # def show 
    #   @model_name = Model_name.find(params[:id])
    # end

  # new action show you the form, to create a new record, create one in memory
    # GET READ 
    # def new 
    #   @model_name = Model_name.new
    # end

  # create action create the record into the database 
    # POST CREATE 
    # def create
    #   @model_name = Model_name.new(model_name_params)

    #   if @model_name.save
    #     do something go somewhere
    #   else
    #     render :new
    #   end
    # end

  # edit action show you the form, to update a record
    # GET READ 
    # def edit 
    #   @model_name = Model_name.find(params[:id])
    # end

  # update action update the record and store in db 
    # PUT UPDATE 
    #   def update
    #     @model_name = Model_name.find(params[:id])
    #     if @model_name.update(model_name_params)
    #       do something go somewhere
    #     else
    #       render :edit
    #     end
    #   end

  # destroy action remove the record in the db
    # DELETE destroy
    # def destroy
    #   @model_name = Model_name.find(params[:id])
    #   @model_name.destroy 
    #   send somewhere 

    #   or 
    #   Model_name.find(params[:id]).destroy
    #   send somewhere 
    # end

  # model_name_params
  # private 
    # def model_name_params
    #   params.require(:model_name).permit(:attr, :attr2, :everything that table has)
    # end

  # Must return HTML, JSON, XML, or redirect into a action that does 
  # GET or a READ action then that will take you to the views of that action
    # render action.html.erb

  # callbacks 
  # perform logic at certain times 
  # before_action
  # after_action 
  # skip_before_action
  # skip_after_action
  # only except 

  # view, partial shared view reuse over and over again 

  # Sub 
  def index
    @subs = Sub.all 
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new 
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end

  def update 
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit 
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_path

    # or
    # Sub.find(params[:id]).destroy
    # redirect_to subs_path
  end

  private 
    def sub_params
      params.require(:sub).permit(:name)
    end
end
