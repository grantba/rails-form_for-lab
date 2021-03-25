class SchoolClassesController < ApplicationController

    def new
        @sc = SchoolClass.new
    end

    def create
        @sc = SchoolClass.new(school_class_params(:title, :room_number))
        @sc.save
        redirect_to school_class_path(@sc)
    end

    def show
        @sc = SchoolClass.find_by(id: params[:id])
    end

    def edit
        @sc = SchoolClass.find_by(id: params[:id])
    end

    def update
        @sc = SchoolClass.find_by(id: params[:id])
        @sc.update(school_class_params(:title, :room_number))
        redirect_to school_class_path(@sc)
    end

    private 
    
    def school_class_params(*args)
        params.require(:school_class).permit(:title, :room_number)
    end

end