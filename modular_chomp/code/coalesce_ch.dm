/proc/coalesce(args...)
    for (var/arg in args)
        if (arg)
            return arg
    return null