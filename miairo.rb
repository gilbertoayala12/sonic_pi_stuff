use_bpm 123
aero = "C:/Sonic pi/aerodynamic/funk.wav"
load_sample aero

live_loop :Foo do
  
  sync :main
  with_fx :ixi_techno, mix: 0.1, phase: 8, cutoff_min: 90 do
    sample aero, 0
    sleep sample_duration aero
  end
  
end
live_loop :main do
  sleep 4
end
live_loop :bell do
  stop
  sync :main
  use_synth :pretty_bell
  use_synth_defaults release: 9
  with_fx :gverb, room: 20 do
    play :A1
    play :A2
    play :A3
    play :A4
    play :A5
    sleep 8
  end
  
end
live_loop :solo do
  sync :main
  
  use_synth :zawa
  use_synth_defaults attack: 0.05, sustain: 0.15, release: 0.125
  
  phases = [
    [:D4, :Fs3, :B3, :Fs3],
    [:D4, :Gs3, :B3, :Gs3],
    [:G4, :B3, :E4, :B3],
    [:E4, :A3, :Cs4, :A3],
    
    [:D4, :Fs4, :B3, :Fs4],
    [:D4, :Gs4, :B3, :Gs4],
    [:G4, :B3, :E4, :B3],
    [:E4, :A3, :Cs4, :A3],
  ]
  
  phases.each do |notes|
    4.times do
      notes.each do |n|
        play n
        sleep 0.25
      end
    end
  end
end