--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: return_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_status (
    return_status_id character varying(20) NOT NULL,
    status_id character varying(20),
    return_id character varying(20),
    return_item_seq_id character varying(20),
    change_by_user_login_id character varying(255),
    status_datetime timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_status OWNER TO ofbiz;

--
-- Name: return_status pk_return_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_status
    ADD CONSTRAINT pk_return_status PRIMARY KEY (return_status_id);


--
-- Name: rtn_stts_rtn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_stts_rtn ON return_status USING btree (return_id);


--
-- Name: rtn_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_stts_stts ON return_status USING btree (status_id);


--
-- Name: rtn_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_stts_usrlgn ON return_status USING btree (change_by_user_login_id);


--
-- Name: rtrn_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_stts_txcrts ON return_status USING btree (created_tx_stamp);


--
-- Name: rtrn_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_stts_txstmp ON return_status USING btree (last_updated_tx_stamp);


--
-- Name: return_status rtn_stts_rtn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_status
    ADD CONSTRAINT rtn_stts_rtn FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- Name: return_status rtn_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_status
    ADD CONSTRAINT rtn_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: return_status rtn_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_status
    ADD CONSTRAINT rtn_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

