class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    layout 'portfolio'
    access all: [:show, :index, :angular_portfolio, :ruby_on_rails_portfolio], user: {except: [:destroy, :new, :create, :update, :edit]}, admin: :all

    def show
        @page_title = @portfolio.title
    end

    def index
        @page_title = "My Portfolios"
        @portfolios = Portfolio.by_position
    end

    def sort
        params[:order].each do |key, value|
          Portfolio.find(value[:id]).update(position: value[:position])
        end
        render 'index'
    end
    
    def angular_portfolio
        @portfolios = Portfolio.angular
    end
    
    def ruby_on_rails_portfolio
        @portfolios = Portfolio.ruby_on_rails_portfolio
    end

    def new
        @portfolio = Portfolio.new
        3.times { @portfolio.technologies.build }
    end

    def edit
        # @portfolio = Portfolio.find(params[:id])
        3.times { @portfolio.technologies.build }
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

    def destroy
        if @portfolio.destroy
            redirect_to portfolios_path
        else
            redirect_to portfolios_path
        end
    end

    private
    def set_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image, technologies_attributes: [:name])
    end
end
