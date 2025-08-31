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
-- Name: requirement_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE requirement_status (
    requirement_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    status_date timestamp with time zone,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.requirement_status OWNER TO ofbiz;

--
-- Name: requirement_status pk_requirement_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_status
    ADD CONSTRAINT pk_requirement_status PRIMARY KEY (requirement_id, status_id);


--
-- Name: req_stts_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_stts_req ON requirement_status USING btree (requirement_id);


--
-- Name: req_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_stts_stts ON requirement_status USING btree (status_id);


--
-- Name: req_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_stts_usrlgn ON requirement_status USING btree (change_by_user_login_id);


--
-- Name: rqrmnt_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrmnt_stts_txcrts ON requirement_status USING btree (created_tx_stamp);


--
-- Name: rqrmnt_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrmnt_stts_txstmp ON requirement_status USING btree (last_updated_tx_stamp);


--
-- Name: requirement_status req_stts_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_status
    ADD CONSTRAINT req_stts_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- Name: requirement_status req_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_status
    ADD CONSTRAINT req_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: requirement_status req_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_status
    ADD CONSTRAINT req_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

