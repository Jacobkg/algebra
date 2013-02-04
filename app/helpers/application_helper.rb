module ApplicationHelper

  def tablify(equation, left_width)
    equation_left_array = equation.left.to_s.split(" ")
    equation_left_array = [""] * (left_width - equation_left_array.count) + equation_left_array
    ("<tr>" + equation_to_table(equation_left_array) + "<td>=</td>" + equation_to_table(equation.right.to_s.split(" ")) + "</tr>").html_safe
  end

  private

  def equation_to_table(equation_array)
    equation_array.map {|n| "<td>#{n}</td>"}.join("")
  end

end
