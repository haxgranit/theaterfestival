class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :load_permissible

  # GET /permissions
  def index
    @permissions = @permissible.permissions
  end

  # GET /permissions/1
  def show
  end

  # GET /permissions/new
  def new
    @permission = @permissible.permissions.new
  end

  # GET /permissions/1/edit
  def edit
    @user = User.find(@permission.user_id)
  end

  # POST /permissions
  def create
    @permission = @permissible.permissions.new(permission_params)
    if @permission.save
      redirect_to [@permissible, :permissions], notice: 'Permission created'
    else
      render :new
    end
  end

  # PATCH/PUT /permissions/1
  def update
    if @permission.update(permission_params)
      redirect_to @permission, notice: 'Permission was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /permissions/1
  def destroy
    @permission.destroy
    redirect_to permissions_url, notice: 'Permission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def permission_params
      params.require(:permission)
        .permit(:user_id,
                :resource,
                :user)
    end

    def load_permissible
      resource, id = request.path.split('/')[1,2]
      @permissible = resource.singularize.classify.constantize.find(id)
    end

end
