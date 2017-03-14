
2.times do
  
  use_synth :chiplead
  
  play_pattern_timed([:f4,:a4,:b4,nil,:f4,:a4,:b4,nil,:f4,:a4,:b4,:e5,:d5,nil,:b4,:c5,:b4,:g4,:e4,nil,nil,nil,nil,:d4,:e4,:g4,:e4], [0.20] )
  
  sleep 0.3
end
