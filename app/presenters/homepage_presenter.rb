class HomepagePresenter
  attr_reader :categories

  def initialize(view_context)
    @view_context = view_context
    @categories = load_categories
  end

  def chart_data
    @categories.map { |category| [category.title, category.sum] }
  end

  def chart_colors
    @categories.map { |category| category.hex_color }
  end

  private

  def load_categories
    @view_context.current_user
      .categories
      .joins(:transactions)
      .where(transactions: { kind: 0 })
      .select(
        'id',
        'title',
        'color',
        'SUM
(transactions.amount) AS sum'
      )
      .group('title')
      .order(sum: :desc)
  end
end
