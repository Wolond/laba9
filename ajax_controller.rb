# frozen_string_literal: true



class AjaxController < ApplicationController
  def show
    max = params[:max].to_i
    @it = function max
    respond_to do |format|
      format.json { render json: { it: @it } }
      format.html
    end
  end

  def time; end

private

  def function(max)
    fac = 1
    i = 0
    ans = []
    max.times do
      i += 1
      fac *= i
      um = (fac**(1.0 / 3.0)).div(1) - 1
      buf = 0
      loop do
        buf = um * (um + 1) * (um + 2)
        flag = 0
        break if buf >= fac

        um += 1
      end
      ans << { 'i' => i, 'res' => buf, 'exp' => fac }
    end
    ans
  end

end
