class TownGenerator::Person < TownGenerator::Model
  def job
    self[:job]
  end

  def workplace
    self[:workplace]
  end
  
  #TODO - keep a record of former jobs
  
  def leave_job
    self.delete(:job)
    workplace.workers.delete(self)
    self.delete(:workplace)
  end
end