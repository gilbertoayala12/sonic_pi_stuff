notes = (scale :g1, :minor)
use_bpm 50
r = [0.125,0.25].choose
live_loop :amen do
  sync :main
  
  with_fx :slicer, phase: r, wave:0 ,mix:1 do
    sample :loop_amen, beat_stretch: 2, cutoff:120
    
  end
  sleep 2
  
end
live_loop :bass do
  stop
  sync :main
  use_synth :square
  
  with_fx :slicer,   wave:3, invert_wave:1,  phase: 0.125, amp: 2 do
    play :e1 , attack: 1, release: 2, decay: 0.5
  end
  sleep 2
  
end
live_loop :main do
  sleep 2
end

live_loop :notes do
  sync :main
  use_synth :dark_ambience
  with_fx :wobble, wave: 1, invert_wave:1, probability: 0.125 do
    play :b2, release: 2, amp: 4
    
  end
  
  sleep 2
end

live_loop :lili do
  use_synth  :sine
  with_fx :compressor, phase:rrand(0.100,0.500)  do
    sync :main
    play :b2, release: 2
    play :a3, release: 2
    sleep 2
    play :e3, release: 2
    sleep 2
  end
end


live_loop :lead do
  stop
  sync :amen
  use_synth :tb303
  
  play notes.choose ,cutoff: 100 , release: 2
  sleep 0.250
end
