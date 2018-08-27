sched = parcluster('local')

job = createJob(sched)

%createTask(job,@propAreasIntersecc,1,                   {});
%createTask(job,@propAreasIntersecc,[1 1],             { {} {} });
%createTask(job,@propAreasIntersecc,[1 1 1],           { {} {} {} });
createTask(job,@propAreasIntersecc,[1 1 1 1],         { {} {} {} {} });
%createTask(job,@propAreasIntersecc, [1 1 1 1 1],      { {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1],    { {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1],  { {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {} {} {}});

tic
submit(job);

wait(job)
sal = fetchOutputs(job);
toc

sal{1}
sal{2}
sal{3}
sal{4}
%sal{5}
%sal{6}
%sal{7}
%sal{8}
%sal{9}
%sal{10}

destroy(job)
