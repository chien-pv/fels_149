module ResultsHelper

  def label_answer is_correct
    if is_correct
      content_tag(:p, class: "label label-primary") do
        content_tag(:span, t("results.answer.correct_answer"))
      end
    else
      content_tag(:p, class: "label label-danger") do
        content_tag(:span, (t "results.answer.wrong_answer"))
      end
    end
  end
end
