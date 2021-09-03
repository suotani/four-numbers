class GamesController < UserController

  before_action :set_game_and_redirect, only: [:show, :check]
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def show
    @answer ||= Answer.new
  end

  def check
    @number = params[:number]
    @answer ||= Answer.create(user_id: current_user.id, game_id: params[:id])
    @match_count = 0
    @include_count = 0
    @answer.count = @answer.count + 1
    if @number == @game.number # 成功パターン
      @answer.update(clear: true, fin: true)
      current_user.update(deposit: current_user.deposit + @game.bet, win_count: current_user.win_count + 1)
    elsif @answer.count == @game.limit # 失敗パターン
      @answer.update(fin: true)
      current_user.update(deposit: [current_user.deposit - @game.bet, 0].max, lose_count: current_user.lose_count + 1)
    else # ゲーム継続
      @answer.save
      @game.number.split("").each_with_index do |n, i|
        if @number.split("")[i] == n
          @match_count += 1
        end
      end

      @include_count = 8 - (@number.split("") + @game.number.split("")).uniq.size - @match_count
    end
  end

  def fin
    @answer = Answer.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title, :limit, :number, :bet).tap do |v|
      v[:user_id] = current_user.id
    end
  end

  def set_game_and_redirect
    @game = Game.find(params[:id])
    @answer = Answer.where(user_id: current_user.id, game_id: @game.id).first
    if @game.user_id == current_user.id || Answer.where(game_id: @game.id, user_id: current_user.id, fin: true).present?
      redirect_to games_path
    end
  end
end