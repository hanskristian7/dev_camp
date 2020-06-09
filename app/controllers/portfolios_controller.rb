class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update]
    
    def show
        
    end

    def index
        @portfolios = Portfolio.all
    end

    def new
        @portfolio = Portfolio.new
    end

    def edit
        # @portfolio = Portfolio.find(params[:id])
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        if @portfolio.save
            redirect_to portfolios_path
        else
            render 'new'
        end
    end

    def update
        # byebug
        # portfolio = Portfolio.find(params[:id])
        if @portfolio.update(portfolio_params)
            redirect_to portfolios_path
        else
            render 'edit'
        end
    end

    private
    def set_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end
