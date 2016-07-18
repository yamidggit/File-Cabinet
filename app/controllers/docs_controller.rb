class DocsController < ApplicationController
    before_action :find_doc, only:[:show, :edit, :update, :destroy]   
    def index
        @docs=Doc.all.order("created_at DESC") #this put documents in the orther they were created(newest at the top)
    end

    def new
        @doc= Doc.new
    end
    
    def show
    end
    
    def create
        @doc = Doc.new(doc_params)
        
        
        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
        
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
        def find_doc
            @doc = Doc.find(params[:id])
        end
        
        def doc_params # method used to not repeat ourself
             params.require(:doc).permit(:title, :content)
        end
        
end