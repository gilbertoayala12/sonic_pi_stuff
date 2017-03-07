# Welcome to Sonic Pi v2.11.1
live_loop :white_main do
  
  
  use_bpm 130
  use_synth :saw
  use_synth_defaults cutoff: 70,  release: 8
  # use_random_seed 2000
  notes = [
    [:c3,:e3,:g3,:b3],
    [:g2 ,:d3, :Fs3, :a3],
    [:c3,:e3,:g3,:b3],
    [:g2, :b2, :d3, :g3],
  ]
  notes.each do |notes|
    play_chord notes
    sleep 8
  end
end



live_loop :drummies do
  stop
  sync :main
  use_bpm 130
  sample :drum_snare_hard
  sleep 1
  sample :drum_snare_hard
  sleep 0.5
  sample :drum_snare_hard
  sleep 1
  sample :drum_snare_hard
  sleep 2
end
#########################################
## Sonic Pi Drum Machine
## coded by Darin Wilson
## changed by Xavier Riley
##

use_bpm 65

in_thread(name: :drum_machine) do
  sync :white_main
  # choose your kit here (can be :acoustic, :acoustic_soft, :electro, :toy)
  use_kit :acoustic
  
  # program your pattern here - each item in the list represents 1/4 of a beat
  # for each item, enter a number between 0 and 9 (0=silent,9=loudest)
  hat   [5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5,  5, 5, 5, 5]
  kick  [9, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0]
  snare [0, 0, 0, 0,  5, 0, 0, 5,  0, 5, 0, 0,  5, 0, 0, 0]
  
  @give_the_drummer_some = false
  
end



##################################################################
##
## The gory details - you don't need to change anything down here,
## unless you're curious :)
##

drum_kits = {
  acoustic: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_hard,
    snare: :drum_snare_hard
  },
  acoustic_soft: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_soft,
    snare: :drum_snare_soft
  },
  electro: {
    hat:   :elec_triangle,
    kick:  :elec_soft_kick,
    snare: :elec_hi_snare
  },
  toy: {
    hat:   :elec_tick,
    kick:  :elec_hollow_kick,
    snare: :elec_pop
  }
}
current_drum_kit = drum_kits[:acoustic]


define :use_kit do |kit_name|
  current_drum_kit = drum_kits[kit_name]
end

live_loop :pulse do
  sleep 4
end

define :run_pattern do |name, pattern|
  live_loop name do
    sync :pulse
    pattern = pattern.shuffle if @give_the_drummer_some
    pattern.each do |p|
      sample current_drum_kit[name], amp: p/9.0#, rate: (rrand(0,0.05)+0.5+(p/9.0))#, start: rrand(0, 0.05)
      sleep 0.25
    end
  end
end

define :hat do |pattern|
  run_pattern :hat, pattern
end

define :kick do |pattern|
  run_pattern :kick, pattern
end

define :snare do |pattern|
  run_pattern :snare, pattern
end
