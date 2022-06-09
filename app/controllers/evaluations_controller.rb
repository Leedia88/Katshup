class EvaluationsController < ApplicationController
  def create
    grade = params[:grade].to_i
    product = Product.find(params[:product_id])
    rating = Evaluation.find_by(user: current_user, product: product)
    if rating
      rating.update(grade: grade)
    else
      Evaluation.create(user: current_user, product: product, grade: grade)
    end
  end

  def update
  end
end
