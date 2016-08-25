class WordsController < ApplicationController
  def index
    @categories = Category.all
    @words = Word.of_category(params[:category_id])
      .result_filter(current_user.id, params[:check_learned])
      .paginate(page: params[:page], per_page: Settings.per_page)
    respond_to do |format|
      format.html
      format.xlsx {render xlsx: "export_excel", filename: "words.xlsx"}
      format.pdf do
        pdf = WickedPdf.new
          .pdf_from_string(render_to_string("words/export_pdf.html.erb",
          layout: false), orientation: "Landscape")
        send_data(pdf, filename: "words.pdf")
      end
    end
  end
end
