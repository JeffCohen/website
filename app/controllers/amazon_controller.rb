class AmazonController < ApplicationController

  DATA = [
          ["B01DFKC2SO",49.99,"Echo Dot (2nd Generation)","Echo Dot is a hands-free, voice-controlled device with a small built-in speaker—it can also connect to your speakers or headphones over Bluetooth or through a 3.5 mm audio cable to deliver stereo sound to the speakers you choose. Dot connects to the Alexa Voice Service to play music, provide information, news, sports scores, weather, and more—instantly."],
          ["B01JP436TS",108.00,"Sennheiser HD 598 Closed Back Headphone","The HD 598 Cs provides impeccable sound quality and effective noise isolation. A closed-back design employing rigorous acoustic engineering, it delivers incredibly natural, detailed and balanced sound allowing enjoyment of your favorite music without disturbing your surroundings or being disturbed by it."],
          ["B0160R1LEK",199.99,"Ninja Coffee Bar Brewer","Only Auto-iQ One-Touch Intelligence by Ninja allows you to Choose a size, Choose a brew. Auto-iQ draws just the right amount of water needed from the reservoir, based on the brew size (from cup to travel mug to carafe) and brew type you select."]
         ]

  def index
    render json: DATA
  end


end
