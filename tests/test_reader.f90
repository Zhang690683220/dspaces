program test_writer_f
use dspaces
    type(dspaces_client) :: ndscl
    integer :: rank
    integer :: i, j, ierr
    integer(kind=8), dimension(2) :: lb, ub
    real(kind=8), dimension(10,10) :: data
    character, pointer :: listen_addr_str => NULL ()

    rank = 0
    
    
    call dspaces_init(rank, ndscl, listen_addr_str, ierr)
    lb(1) = 0
    lb(2) = 0
    ub(1) = 9
    ub(2) = 9
    call dspaces_get(ndscl, "md0", 0_4, lb, ub, data, -1, ierr)
    do i = 1, 10
        do j = 1, 10
            if(abs(data(i,j) - (2 * i + j)) > 1.0E-5) then
                write(0,*) "Incorrect value ",data(i,j)
            endif
        end do
    end do
    call dspaces_kill(ndscl)
    call dspaces_fini(ndscl, ierr)
end program test_writer_f
