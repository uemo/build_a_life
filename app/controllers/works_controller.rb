class WorksController < ApplicationController

	def new
		@work = Work.new
	end

	def edit
		@work = Work.find(params[:id])
	end

	def crete
		@work = Work.new(work_params)
		if @work.save
			flash[:notice] = "タグを登録しました。"
			redirect_to works_path
		else
			flash[:notice] = "タグの登録に失敗しました。"
			redirect_to new_work_path
		end
	end

	def update
		@work = Work.find(params[:id])
        if @work.update(work_params)
           flash[:notice] = 'タグを編集しました。'
           redirect_to works_path
        else
           flash[:notice] = '必要項目を入力してください。'
           render :edit
        end
    end

    def destroy
        work = Work.find(params[:id])
        work.destroy
        flash[:notice] = "タグを削除しました。"
        redirect_to works_path
    end

	private
	def work_params
		params.require(:work).permit(:work_title,
			                         :status_k,
			                         :status_g,
			                         :status_m,
			                         :status_c,
			                         :status_s,
			                         :exp,
			                         :work_image)
	end
end
