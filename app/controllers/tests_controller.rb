class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  $results = Array.new(10,false)
  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
    @users = User.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.user_id = current_user.id

    @test.good_answers = 0
    if @test.question1 == 2
      @test.good_answers +=1
      $results[0] = true
    end
    if @test.question2 == 2
      @test.good_answers +=1
      $results[1] = true
    end
    if @test.question3 == 3
      @test.good_answers +=1
      $results[2] = true
    end
    if @test.question4 == 1
      @test.good_answers +=1
      $results[3] = true
    end
    if @test.question5 == 1
      @test.good_answers +=1
      $results[4] = true
    end
    if @test.question6 == 2
      @test.good_answers +=1
      $results[5] = true
    end
    if @test.question7 == 3
      @test.good_answers +=1
      $results[6] = true
    end
    if @test.question8 == 4
      @test.good_answers +=1
      $results[7] = true
    end
    if @test.question9 == 3
      @test.good_answers +=1
      $results[8] = true
    end
    if @test.question10 == 2
      @test.good_answers +=1
      $results[9] = true
    end

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :good_answers)
    end
end
