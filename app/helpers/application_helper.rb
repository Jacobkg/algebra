module ApplicationHelper

  def tablify(equation, left_width)
    equation_left_array = [""] * (left_width - equation.left.count) + equation.left
    ("<tr>" + equation_to_table(equation_left_array) + "<td>=</td>" + equation_to_table(equation.right) + "</tr>").html_safe
  end

  private

  def equation_to_table(equation_array)
    equation_array.map {|n| "<td>#{n}</td>"}.join("")
  end

end
