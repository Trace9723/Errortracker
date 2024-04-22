class ErrorsController < ApplicationController
    before_action :authenticate_user!

    def index
        @errors = current_user.error
    end

    def show
        @error = Error.find(params[:id])
    end

    def create
        @error = Error.new(error_params)

        if @error.save
            redirect_to @error
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @error = Error.find(params[:id])

        if @error.update(error_params)
            redirect_to @error
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destory
        @error = error.find(params[:id])
        @error.destory

        redirect_to root_path, status: :see_other
    end

    private
        def set_error
            @error = current_user.error.find(params[:id])
        end

        def error_params
            params.require(:error).permit(:name, :priority)
        end
end
