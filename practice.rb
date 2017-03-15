
live_loop :beatsI do
  sample :bd_tek
  with_fx :echo, phase: 0.125, mix: 0.4 do
    sample :drum_cymbal_hard, sustain:0,release: 0.1
    sleep 0.5
  end
  
  
  
end
live_loop :beats do
  sample :bd_haus
  sleep 0.5
end
live_loop :beats0 do
  sample :drum_bass_soft
  sleep 1
end


live_loop :bass do
  stop
  use_synth :tb303
  synth :tb303, note: :e2, release: 4, cutoff: 120,
    cutoff_attack: 1
  sleep 4
end

with_fx :echo do
  
  live_loop :vortex do
    use_random_seed 2000
    notes = (scale :e5, :melodic_minor_desc, num_octaves: 2)
    16.times do
      play notes.choose, release: 0.1, amp: 1.5
      sleep 0.125
    end
  end
end