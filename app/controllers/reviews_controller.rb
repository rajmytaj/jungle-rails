class ReviewsController < ApplicationController
    before_filter :authorize, :except => [:show]
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user
      if @review.save
        redirect_to @product, notice: 'Review was successfully created.'
      else
        redirect_to @product, notice: 'Review failed to save.'
      end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to @review.product, notice: 'Review was successfully deleted.'
    end

    private

    def review_params
        params.require(:review).permit(:description, :rating)
    end
end