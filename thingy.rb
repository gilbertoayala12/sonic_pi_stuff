with_fx :reverb, room: 0 do
  
  live_loop :time do
    stop
    synth :prophet, release: 8, note: :e3, cutoff: 90, amp: 3
    sleep 8
  end
end

live_loop :kik do
  sample :bd_haus, amp: 2
  sleep 0.5
end
with_fx :echo do
  live_loop :vortex do
    in_thread do
      use_synth :chipbass
      use_random_seed 800
      notes = (scale :e1, :minor_pentatonic, num_octaves: 2)
      16.times do
        play notes.choose, release: 0.1, amp: 1.5
        sleep 0.250
      end
    end
    
    use_synth :chiplead
    use_random_seed 500
    notes = (scale :e2, :minor_pentatonic, num_octaves: 2)
    16.times do
      play notes.choose, release: rrand(0.125,0.25), amp: 1.5, env_curve:1
      sleep 0.125
    end
  end
  
end

