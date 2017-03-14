use_bpm 128

live_loop :bass do
  
  
  with_fx :bitcrusher, wave: 0, invert_wave: 1, phase: 0.100 do
    #synth :square, note: :d2, sustain: 0.1, cutoff: rrand(60,120), amp: 1
    #synth :square, note: :d5, sustain: 0.04, cutoff: rrand(60,120)
    sleep 0.25
  end
  
end
live_loop :drum do
  with_fx :slicer, phase: 0.125, mix: 0.3 do
    sample :bd_haus,  env_curve:1, amp: 2, rate: rrand(0.500, 1)
  end
  sleep 1
end

live_loop :ss do
  use_synth :pluck
  with_fx :echo, phase: 0.250 do
    play 58
    sleep 0.5
    play 60
    sleep 0.5
    play 65
    sleep 0.5
    play 70
    sleep 0.5
    
  end
end







