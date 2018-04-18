class DemoController < ApplicationController

    layout false

  def index
    # Don't need this!
    render('index')
  end

  def hello
    # Don't need this!
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

end
