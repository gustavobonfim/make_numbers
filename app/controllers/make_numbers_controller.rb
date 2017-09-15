class MakeNumbersController < ApplicationController

  def cnpj
    cnpj_root = Array.new(12) { rand(10) }

    # calculate first digit
    factor = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    sum = (0..11).inject(0) do |sum, i|
      sum + cnpj_root[i] * factor[i]
    end

    first_validator = sum % 11
    cnpj_root << first_validator = first_validator < 2 ? 0 : 11 - first_validator

    # calculate second digit
    factor.unshift 6

    sum = (0..12).inject(0) do |sum, i|
      sum + cnpj_root[i] * factor[i]
    end

    second_validator = sum % 11
    new_cnpj = (cnpj_root << second_validator = second_validator < 2 ? 0 : 11 - second_validator).join

    # cnpj_pretty = new_cnpj.to_s.rjust(14, "0")
    # cnpj_pretty = "%s.%s.%s/%s-%s" % [new_cnpj[0,2], new_cnpj[2,3], new_cnpj[5,3], new_cnpj[8,4], new_cnpj[12,2]]

    cnpj = []
    cnpj << {:name => "CNPJ", :cnpj => new_cnpj}

    render :json => {:cnpj => cnpj}.as_json
  end

  def cpf
    cpf_root = Array.new(9) { rand(10) }

    # calculate first digit
    sum = (0..8).inject(0) do |sum, i|
      sum + cpf_root[i] * (10 - i)
    end

    first_validator = sum % 11
    first_validator = first_validator < 2 ? 0 : 11 - first_validator
    cpf_root << first_validator

    # calculate second digit
    sum = (0..8).inject(0) do |sum, i|
      sum + cpf_root[i] * (11 - i)
    end

    sum += first_validator * 2

    second_validator = sum % 11
    second_validator = second_validator < 2 ? 0 : 11 - second_validator
    new_cpf = (cpf_root << second_validator).join

    cpf = []
    cpf << {:name => "CPF", :cpf => new_cpf}

    render :json => {:cpf => cpf}.as_json

  end

end
