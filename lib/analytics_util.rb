module AnalyticsUtil
  def pearson_r(x, y)
    n=x.length

    sum_x = x.inject(0) { |r, i| r + i }
    sum_y = y.inject(0) { |r, i| r + i }

    sum_x_sq = x.inject(0) { |r, i| r + i**2 }
    sum_y_sq = y.inject(0) { |r, i| r + i**2 }

    prods = []; x.each_with_index { |this_x, i| prods << this_x*y[i] }
    p_sum = prods.inject(0) { |r, i| r + i }

    # Calculate Pearson score
    num = p_sum-(sum_x*sum_y/n)
    den = ((sum_x_sq-(sum_x**2)/n)*(sum_y_sq-(sum_y**2)/n))**0.5

    den == 0 ? 0 : num/den
  end
end