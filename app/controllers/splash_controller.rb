class SplashController < ApplicationController 

  def index 
  end

  def test_fxn
    @dog = ['dog1', 'dog2', 'dog3']
    sleep(3)
    show
    
  end

  def show 
    
  end
  
end