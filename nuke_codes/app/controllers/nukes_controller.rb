class NukesController < ApplicationController

  require 'digest'

  def index
    code = Time.now.strftime('%Y%M%H')

    if current_user.has_role?(:president)
      @code = code[0...(code.length/2)]
    elsif current_user.has_role?(:defence)
      @code = code[(code.length/2)..100]
    elsif current_user.has_role?(:russians)
      @code = code
    end
  end

end
