require 'minitest/autorun'
require 'minitest/pride'
require './lib/aes-everywhere.rb'


class AES256Test < Minitest::Test
  def test_decrypt1
    text = AES256.decrypt("U2FsdGVkX1+Z9xSlpZGuO2zo51XUtsCGZPs8bKQ/jYg=", "pass")
    assert_equal text, "test"
  end

  def test_decrypt2
    text = AES256.decrypt("U2FsdGVkX1+8b3WpGTbZHtd2T9PNQ+N7GqebGaOV3cI=", "Data π ΡΠ΅ΠΊΡΡ")
    assert_equal text, "test"
  end

  def test_decrypt3
    text = AES256.decrypt("U2FsdGVkX18Kp+T3M9VajicIO9WGQQuAlMscLGiTnVyHRj2jHObWshzJXQ6RpJtW", "pass")
    assert_equal text, "Data π ΡΠ΅ΠΊΡΡ"
  end

  def test_decrypt4
    text = AES256.decrypt("U2FsdGVkX1/O7iqht/fnrFdjn1RtYU7S+DD0dbQHB6N/k+CjzowfC2B21QRG24Gv", "Data π ΡΠ΅ΠΊΡΡ")
    assert_equal text, "Data π ΡΠ΅ΠΊΡΡ"
  end

  def test_encrypt_decrypt1
    text = "Test! @#$%^&*"
    pass = "pass"
    enc = AES256.encrypt(text, pass)
    dec = AES256.decrypt(enc, pass)
    assert_equal text, dec
  end

  def test_encrypt_decrypt2
    text = "Test! @#$%^&*( ππ΅π€‘π εη½ γγγ«γ‘γ ΠΠΊΡΡ πΊ"
    pass = "pass"
    enc = AES256.encrypt(text, pass)
    dec = AES256.decrypt(enc, pass)
    assert_equal text, dec
  end

  def test_encrypt_decrypt3
    text = "Test! @#$%^&*( ππ΅π€‘π εη½ γγγ«γ‘γ ΠΠΊΡΡ πΊ"
    pass = "εη½ γγγ«γ‘γ ΠΠΊΡΡ πΊ"
    enc = AES256.encrypt(text, pass)
    dec = AES256.decrypt(enc, pass)
    assert_equal text, dec
  end
end
