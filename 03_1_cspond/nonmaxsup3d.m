function maximg=nonmaxsup3d(response, threshold)
  maximg = response;
  [H, W, L] = size(response);
  for level=1:L
    level_start = level-1;
    level_r = 2;
    if level_start < 1
      level_start = 1;
      level_r = 1;
    end
    level_end = level+1;
    if level_end > L
      level_end = L;
    end
      
    for i=1:H
      i_start = i-1;
      i_r = 2;
      if i_start < 1
        i_start = 1;
        i_r = 1;
      end
      i_end = i+1;
      if i_end > H
        i_end = H;
      end

      for j=1:W
        j_start = j-1;
        j_r = 2;
        if j_start < 1
          j_start = 1;
          j_r = 1;
        end
        j_end = j+1;
        if j_end > W
          j_end = W;
        end

        R = response(i_start:i_end, j_start:j_end, level_start:level_end);
        R = R(:);
        linearInd = sub2ind([i_end-i_start+1, j_end-j_start+1, ...
          level_end-level_start+1], i_r, j_r, level_r);
        R(linearInd) = [];

        max_val = max(R);
        if (response(i, j, level) > max_val) && (max_val > threshold)
          maximg(i, j, level) = 1;
        else
          maximg(i, j, level) = 0;
        end
      end
    end
  end
end

% function extrema=nonmaxsup3d(response, threshold)
%    
%    extrema=logical(zeros(size(response)));
%    extrema(2:end-1,2:end-1,2:end-1) =... 
%        response(2:end-1,2:end-1,2:end-1) > threshold & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,2:end-1) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,2:end-1,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,1:end-2) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,2:end-1,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,3:end  ) & ...
%        response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,3:end  );