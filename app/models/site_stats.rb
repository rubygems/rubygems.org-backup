module SiteStats

  ACTIVE_GEMS = "stats:active_gems"
  LATEST_GEMS = "stats:latest_gems"
  LATEST_VERSIONS = "stats:latest_versions"

  module_function

  def rewrite!
    $redis.set ACTIVE_GEMS, Rubygem.total_count

    ids = Rubygem.latest.map { |i| i.id }.join(" ")
    $redis.set LATEST_GEMS, ids

    ids = Version.just_updated.map { |i| i.id }.join(" ")
    $redis.set LATEST_VERSIONS, ids
  end

  def active_gems
    val = $redis.get ACTIVE_GEMS
    return val.to_i if val

    rewrite!
    $redis.get(ACTIVE_GEMS).to_i
  end

  def latest_gems
    val = $redis.get(LATEST_GEMS)

    unless val
      rewrite!
      val = $redis.get(LATEST_GEMS)
    end

    val.split(" ").map { |i| Rubygem.find(i) }
  end

  def latest_versions
    val = $redis.get LATEST_VERSIONS
    unless val
      rewrite!
      val = $redis.get LATEST_VERSIONS
    end

    val.split(" ").map { |i| Version.find(i) }
  end
end
