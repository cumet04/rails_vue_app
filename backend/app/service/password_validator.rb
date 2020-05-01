class PasswordValidator
  def self.contains_char_types?(str)
    [
      /[A-Z]/,
      /[a-z]/,
      /\d/,
      /[!@#$%\^&\*\(\)\-=_\+\[\]\{\};':",\.\/<>\?]/,
    ].select { |r| r.match(str) }.count >= 3
  end

  def self.long_enough?(str)
    str.length >= 8
  end
end
