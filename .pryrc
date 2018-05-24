Pry::Helpers::Text.module_eval {
	def wild_colors(str, colors = [:red, :green, :yellow, :blue, :purple, :magenta, :cyan])
		str.chars.map { |c| send(colors.sample, c) }.join
	end
}

default_pry_prompt = Pry.config.prompt
wild_env = Pry::Helpers::Text.wild_colors(Rails.env.upcase)
Pry.config.prompt = [
	->(*args) { "#{wild_env} #{Pry::DEFAULT_PROMPT[0].call(*args)}" },
	->(*args) { "#{wild_env} #{Pry::DEFAULT_PROMPT[1].call(*args)}" }
]
